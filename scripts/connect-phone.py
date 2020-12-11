import os
import argparse


def get_args():
    parser = argparse.ArgumentParser(description='Connect to phone at specified ip address')
    parser.add_argument('-f', '--file', type=str)
    parser.add_argument('-r', '--recursive', action='store_true')
    parser.add_argument('-i', '--ip', type=str)
    parser.add_argument('-d', '--destination', type=str, default='.')
    args = parser.parse_args()
    return args


def main():
    args = get_args()
    if not args.ip:
        print('Connecting to phone requires local ip, eg: -i 10.0.0.67')
        print('Other options include:')
        print('\t-f [file/path/on/phone], specify -r flag if folder')
        print('\t-d [destination/path/on/PC]')
    elif args.file and args.destination:
        r = '-r' if args.recursive else ''
        print("Fetching file...")
        print("If this takes too long, try turning phone screen on")
        print("If connection refused, use sshd on phone")
        os.system('scp {} -P 8022 u0_a136@{}:{} {}'.format(r,
                                                           args.ip,
                                                           args.file,
                                                           args.destination))
        print("Downloaded file to: {}".format(args.destination))
    else:
        print("Connecting...")
        os.system("ssh -p '8022' '{}'".format(args.ip))


if __name__ == '__main__':
    main()

