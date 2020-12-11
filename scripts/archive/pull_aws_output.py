import os
from awsconnect import get_publicdns


def main():
    """Pulls outputs files from AWS"""
    remote_folder = '/s3mnt/carla-rl/outputs'
    local_folder = '/home/jeremy/Insight/Project'
    dns = get_publicdns()

    print("fetching data from server...")
    os.system('rsync=$(/home/jeremy/.scripts_custom/rsync_pull_aws \
            ubuntu@{} {} {})'.format(dns, remote_folder,
                                     local_folder))
    print("pulled from {} to {}".format(remote_folder,
                                        local_folder))


if __name__ == "__main__":
    main()
