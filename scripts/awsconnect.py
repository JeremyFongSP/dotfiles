import json
import os
import argparse


def get_args():
    """Parse instance argument"""
    parser = argparse.ArgumentParser(description='Connect to AWS')
    parser.add_argument('-i', '--instance', type=int, default=1)
    parser.add_argument('-x', '--x11', action='store_true')
    parser.add_argument('-v', '--verbose', action='store_true')
    args = parser.parse_args()
    return args


def get_publicdns(dns_no=0):
    """Finds Public DNS key in JSON file"""
    file_path = os.path.dirname('/home/jeremy/.scripts_custom/')
    json_file = "aws-info.json"
    json_path = os.path.join(file_path, json_file)

    os.system("aws ec2 describe-instances > {}".format(json_path))

    # Open/read file and store in variable
    with open(json_path, 'r') as configfile:
        data = configfile.read()

    obj = json.loads(data)

    # Delete json file for security reasons
    os.system("rm {}".format(json_path))

    return obj["Reservations"][dns_no]["Instances"][0] \
        ["NetworkInterfaces"][0]["Association"]["PublicDnsName"]


def main():
    """Creates JSON file, parses it to find Public DNS
       then connects to AWS"""
    # Parse arguments, if none are passed defaults to 0 (first server)
    args = get_args()
    if args.instance == 2:
        dns_no = 1
    else:
        dns_no = 0
    # Find ssh key file
    aws_path = os.path.dirname("/home/jeremy/.aws/")
    ssh_key = "jeremy-IAM-keypair.pem"
    ssh_path = os.path.join(aws_path, ssh_key)

    x_arg = ' '
    if args.x11:
        x_arg = ' -X '

    v_arg = ' '
    if args.verbose:
        v_arg = ' -v '

    # Get public dns
    dns = None
    try:
        dns = get_publicdns(dns_no)
    except KeyError:
        print("Unable to connect. Is the server started?")
        exit()

    # Connect
    print("Connecting to: ", dns)
    os.system('ssh{}{}-i "{}" ubuntu@{}'.format(v_arg, x_arg,
                                                ssh_path, dns))


if __name__ == "__main__":
    main()
