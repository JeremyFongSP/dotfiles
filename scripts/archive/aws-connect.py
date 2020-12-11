import json
import os


def get_publicdns(obj):
    """Finds Public DNS key in JSON file"""
    return obj["Reservations"][0]["Instances"][0] \
        ["NetworkInterfaces"][0]["Association"]["PublicDnsName"]


def main():
    """Creates JSON file, parses it to find Public DNS
       then connects to AWS"""
    # Find files: aws json file and ssh key file
    file_path = os.path.dirname(os.path.realpath(__file__))
    aws_path = os.path.dirname("/home/jeremy/.aws/")
    ssh_key = "jeremy-IAM-keypair.pem"
    ssh_path = os.path.join(aws_path, ssh_key)
    json_file = "aws-info.json"
    json_path = os.path.join(file_path, json_file)

    # Export AWS information
    os.system("aws ec2 describe-instances > {}".format(json_path))

    # Open/read file and store in variable
    with open(json_path, 'r') as configfile:
        data = configfile.read()
    obj = json.loads(data)

    # Get public dns
    dns = get_publicdns(obj)

    # Connect
    os.system('ssh -i "{}" ubuntu@{}'.format(ssh_path, dns))


if __name__ == "__main__":
    main()
