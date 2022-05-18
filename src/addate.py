#!/usr/bin/env python3

# This short program converts AD dates into real dates.

# "The Active Directory stores date/time values as the number of 100-nanosecond 
# intervals that have elapsed since the 0 hour on January 1, 1601 until the 
# date/time that is being stored. The time is always stored in Greenwich Mean 
# Time (GMT) in the Active Directory."
# -- https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/convert-datetime-attributes-to-standard-format

import datetime

# >>> adstart = datetime.datetime(1601,1,1)
# >>> epochstart = datetime.datetime(1970,1,1)
# >>> str(epochstart - adstart)
# '134774 days, 0:00:00'
# >>> 134774 * 24 * 60 * 60
# 11644473600

ad_to_epoch_delta = 11644473600 # seconds

def convert_epoch(date):
    numericdate = int(date)
    numericdate = numericdate/10000000 # convert into seconds
    epoch = numericdate - ad_to_epoch_delta    # convert to unix epoch
    return int(epoch)

def convert(date):
    epoch = convert_epoch(date)
    realdate = str(datetime.datetime.fromtimestamp(epoch))
    return realdate

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description='Convert AD dates.')
    parser.add_argument('ad_date', metavar='<AD Date>', type=int)
    parser.add_argument('-e', action='store_true', help="Print UNIX epoch instead.")

    args=parser.parse_args()

    if args.e:
        print(convert_epoch(args.ad_date))
    else:
        print(convert(args.ad_date))
