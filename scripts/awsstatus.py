import os
import json

def get_instance_status():
    """Finds instance status for each ID"""
    aws_cmd = "aws ec2 describe-instance-status"
    file_path = os.path.dirname('/home/jeremy/.scripts_custom/')
    json_file = "aws-instance-info.json"
    json_path = os.path.join(file_path, json_file)
    os.system("{} > {}".format(aws_cmd, json_path))

    with open(json_path, 'r') as configfile:
        data = configfile.read()

    obj = json.loads(data)

    os.system("rm {}".format(json_path))

    return obj


def main():
    """Start AWS servers"""

    info = get_instance_status()

    instance_num = len(info['InstanceStatuses'])
    instance_statuses = {info['InstanceStatuses'][i]['InstanceId']:
            info['InstanceStatuses'][i]['InstanceState']['Name'] for i in range(instance_num)}
    print("Instance(s) started:", instance_num)
    print(instance_statuses)


if __name__ == "__main__":
    main()
