import subprocess
from awsconnect import get_publicdns


def main():
    """Pulls outputs files from AWS"""
    remote_folder = '/s3mnt/carla-rl/outputs'
    local_folder = '/home/jeremy/Insight/Project'
    dns = get_publicdns()

    try:
        print("fetching data from server...")
        subprocess.call(["/home/jeremy/.scripts_custom/rsync_pull_aws",
                         "ubuntu@{}".format(dns),
                         "{}".format(remote_folder),
                         "{}".format(local_folder)])
        print("pulled from {} to {}".format(remote_folder,
                                            local_folder))
    except FileNotFoundError:
        print('Remote folder requires mounting or remote server is offline')


if __name__ == "__main__":
    main()
