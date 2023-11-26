import json 
import boto3
import os
import sys
import pprint

output_file = open(r'terraform-drift-detection\terraform-code\plan-output\output.json', 'rb')
output_json = json.load(output_file)


session = boto3.Session(profile_name="terraform")
ct = session.client('cloudtrail')
resposnse_paginator = ct.get_paginator('lookup_events')

def get_resource_information(arn=""):
    if arn == "":
        print("ARN can not be empty")
        sys.exit(1)
    region = arn.split(":")[3]
    service_type = arn.split(":")[5].split("/")[0]
    resouce_id = arn.split(':')[5].split('/')[1]
    print("*********************")
    print("Resource Information")
    print(f"Region {region}")
    print(f"Service Type {service_type}")
    print(f"Service Id {resouce_id}")
    return [resouce_id, service_type, region]



def get_cloudtrail_event(resource_information = []):
    try:
        response = resposnse_paginator.paginate(
                            LookupAttributes = [
                                {
                                'AttributeKey': 'ResourceName',
                                'AttributeValue': resource_information[0]
                                },
                            ], 
                            PaginationConfig={
                                    'MaxItems': 1
                                },
                    )
        for event in response:
            #pprint.pprint(event['Events'])
            username = event['Events'][0]['Username']
            print(f'Username who made changes to resources: {username}')
    except Exception:
        print(Exception)    
        
    
   
if __name__ == "__main__": 
    print("************************")
    print(f"Number of resources where drift is found {len(output_json['resource_drift'])}")    
    print('Drift has been detected in following resources')
    for resource in output_json['resource_drift']:
        arn = resource['change']['before']['arn']
        output = get_resource_information(arn)
        get_cloudtrail_event(output)


    


