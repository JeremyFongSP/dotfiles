import os
import sys
import json
import argparse


def get_instanceID(instance_no):
    """Finds instance ID"""
    aws_cmd = "aws ec2 describe-instances"
    file_path = os.path.dirname('/home/jeremy/.scripts_custom/')
    json_file = "aws-info.json"
    json_path = os.path.join(file_path, json_file)
    os.system("{} > {}".format(aws_cmd, json_path))

    with open(json_path, 'r') as configfile:
        data = configfile.read()

    obj = json.loads(data)

    os.system("rm {}".format(json_path))

    return obj["Reservations"][instance_no]["Instances"][0] \
            ["InstanceId"]

def get_args():
    """Parse instance argument"""
    parser = argparse.ArgumentParser(description='Start AWS server')
    parser.add_argument('-i', '--instance', type=int, default=1)
    args = parser.parse_args()
    return args


def main():
    """Start AWS servers"""
    args = get_args()
    if args.instance == 1:
        instance_no = 0
    elif args.instance == 2:
        instance_no = 1
    else:
        print("Please specify which server to start")
        sys.exit()

    instance = get_instanceID(instance_no)

    print("Starting instance: {}".format(instance))
    os.system("aws ec2 start-instances --instance-ids {}".format(
        instance))


if __name__ == "__main__":
    main()
