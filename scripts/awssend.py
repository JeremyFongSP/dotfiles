import os
from awsconnect import get_publicdns


def main():
    """Sends Github files to AWS"""
    remote_folder = '/s3mnt'
    local_folder = '/home/jeremy/Insight/Project/carla-rl'
    dns = get_publicdns()

    print("pushing data to server...")
    os.system('/home/jeremy/.scripts_custom/rsync_send_aws \
            {} ubuntu@{} {}'.format(local_folder, dns,
                                    remote_folder))
    print("pushed from {} to {}".format(local_folder,
                                        remote_folder))


if __name__ == "__main__":
    main()
