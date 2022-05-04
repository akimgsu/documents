# AWS

## Fundamentals
| Title | Description |
| ----- | ----------- |
| Building Blocks | A Region, AZ, Edge locations |
| Compute | EC2, Lambda, Elastic Beanstalk |
| Storage | S3, EBS, EFS, FSx, Storage Gateway |
| DB | RDS, DynamoDB, Redshift |
| Networking | VPCs, API Gateway, Direct Connect, AWS Global Accelerator, Route 53 |
| Well Architected | Operational Excellence, Security, Reliability, Performance Cost |

## IAM
| Title | Description |
| ----- | ----------- |
| Overview | IAM allows you to manage users and their level of access to the AWS console. |

## S3
| Title | Description |
| ----- | ----------- |
| Securing Your Data | Server-Side Encryption, Access Control Lists (ACLs), Bucket Policies|
| Strong Read-After- Write Consistency | After a successful write of a new object (PUT) or an overwrite of an existing object, any subsequent read request immediately receives the latest version of the object.<br/> Strong consistency for list operations, so after a write, you can immediately perform a listing of the objects in a bucket with all changes reflected.|
| Object ACLs | Object ACLs work on an individual object level.  |
| Bucket Policy | Bucket policies work on an entire bucket level. |
| Versioning Objects | Backup, Cannot Be Disabled, Lifecycle Rules, MFA |

## EC2
| Title | Description |
| ----- | ----------- |
| | |
| | |
| | |
| | |
| | |
| | |
| | |


## Decoupling Workflow
### SQS Overview

| Title | Description |
| ----- | ----------- |
| Poll-Based Messaging | allows asynchronous processing of work |
| Delivery Delay | default:0; can be set up to 15 minutes. |
| Message Size | Messages can be up to 256KB of text in any format. |
| Encryption | Messages are encrypted in transit by default, but you can add at-rest. |
| Message Retention | Default : 4 days; can be set between 1 minute and 14 days |
| Long vs Short | Long polling isn't the default but it should be|
| Queue Depth | This can be a trigger for autoscaling |
| Visibility Timeout | Message is locked for 30 seconds |
| DLQ | DLQs are the best sideline |
| Monitor | Make sure you set up an alarm and alert on queue depth |
| FIFO Queue | Ordering with message Group ID & No duplication & 300 messages/s & Cost |

### SNS Overview
| Title | Description |
| ----- | ----------- |
| Push-Based Messaging | It will proactively deliver messages to the endpoints subscribed to it. |
| Subscribers | Kinesis Data Firehose, SQS, Lambda, email ...|
| Message Size | 256KB |
| DLQ support | |
| FIFO or Standard | FIFO only supports SQS as a subscriber |
| Access Policy | |
| Encryption | |

### API GAteway Overview
| Title | Description |
| ----- | ----------- |
| API Gateway | a fully managed service that allows you to easily publish create, maintain, monitor and secure your API |
| Security | Web application firewall (WAF)|
| Stop Abuse | Protect from DDoS |
| No baking | Using API Gateway stops you from baking credentials into your code  |

## Big data

### Redshift
| Title | Description |
| ----- | ----------- |
| 3Vs of Big Data| Volume: Ranges from tera ~ pata, Variety: difference formats, Velocity |
| Redshift | Fully managed huge relational Data warehouse |
| Redshift | Not Standard, Relational, Big|

### EMR
| Title | Description |
| ----- | ----------- |
| EMR | EMR is a managed big data platform that allows you to process vast amounts of data using open-source tools, such as Spark, Hive etc.  |
| EC2 Rules Apply | You can use Reserved and Spot Instance to reduce your cost |
| High Level & VPC | |

### Streaming Data with Kinesis
| Title | Description |
| ----- | ----------- |
| Kinesis | Kinesis allows you to ingest, process, and analyze real-time streaming data.  |
| Data Streams  | Real-time streaming for ingesting data & you're responsible for creating the consumer and scaling the stream |
| Data Firehose | Data transfer tool to get information to S3, Redshift, Elasticsearch & Plug and play with AWS architecture |
| Kinesis Data Analytics | Easy & fully managed real-time serverless service. You only pay for the amount of resources you consume |
| SQS vs Kinesis | Kinesis is more complicated to configure and big data and real-time communication |
| Transforming Data | Data analytics is the easiest way to process data going through Kinesis using SQL |
| Scaling | Data Streams does not automatically scale. Data Firehose does.|

### Athena
| Title | Description |
| ----- | ----------- |
| Athena | This allows you to directly query data in your S3 bucket without loading it into a database. |
| Glue | Glue is a serverless data integration service that makes it easy to discover, prepare, and combine data. <br/> It allows you to perform ETL workloads without managing underlying servers. |
| Serverless | Both solutions are fully managed serverless services/ |
| Better Together | While Athena can work by itself, Glue can design a schema for your data. |

### QuickSight 
| Title | Description |
| ----- | ----------- |
| Overview | BI data visualization & dashboards |

### Elasticsearch 
| Title | Description |
| ----- | ----------- |
| Overview | Analyzing tool. It’s commonly used as part of an Elasticsearch, Logstash, Kibana (ELK) stack. |

## Serverless Architecture
| Title | Description |
| ----- | ----------- |
| Overview | Serverless doesn’t mean we’ve figured out how to run code without computers. Physical data Center > Virtualization > Cloud > Serverless |
| Benefits | Ease of Use, Event Based, Billing (pay as you go)|

### Lambda 
| Title | Description |
| ----- | ----------- |
| Overview |  AWS Lambda is a service that lets you run code without provisioning or managing the underlying servers. |
| Permissions | If your Lambda function needs to make an AWS API call, you’ll need to attach a role. |
| Networking | You can (optionally) define the VPC, subnet, and security groups your functions are a part of. |
| Resources & Trigger | Defining memory & events |
| Limitations | 10GB memory and 15 minutes|

### Container 
| Title | Description |
| ----- | ----------- |
| Overview | They’re easier to run on-site and move around to different environments. |
| Dockerfile | Text document that contains all the commands or instructions that will be used to build an image.|
| Image | Immutable file that contains the code, libraries, dependencies, and configuration files needed to run an application. |
| Registry | Stores Docker images for distribution. They can be both private and public. |
| Container | A running copy of the image that has been created. |

### ECS or EKS 
| Title | Description |
| ----- | ----------- |
| Overview | Management of Containers at Scale, Role Integration, ELB Integration |
| EKS Overview | AWS-managed version of open- source Kubernetes container management solution. Best used when you’re not all in on AWS. More work to configure and integrate with AWS. |

### Fargate
| Title | Description |
| ----- | ----------- |
| Overview | AWS Fargate is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). |
| EC2 vs Fargate | No OS, Pay based on resources, Short-running tasks, Isolated environments |
| Lambda vs Fargate | Fargate is for containers and applications that need to run longer. Lambda excels at short and simple functions. |
| Required Tools | ECS or EKS is a requirement. Fargate doesn’t work by itself. |

### EventBridge
| Title | Description |
| ----- | ----------- |
| Overview | Amazon EventBridge(CloudWatch Events) is a serverless event bus. It allows you to pass events from a source to an endpoint. Essentially, it's the glue that holds your serverless application together. |
| Rule | * Define Pattern * Select Event Bus * Select Your Target * Tag * Sit Back |

## Security
### DDoS
| Title | Description |
| ----- | ----------- |
| Overview | |
| 3-way Handshake | The client sends a SYN(synchronize) packet to a server, the server replies with a SYN-ACK, and the client then responds to that with an ACK. <br/> After the TCP connection is established. After this applications begin sending data using Layer 7 (application layer protocol), such as HTTP etc.|
| Layer 4 DDoS Attack | SYN Flood, It works at the transport layer(TCP)|
| NTP amplification | Amplification/reflection attacks can include things such as NTP(Network Time Protocol), SSDP, DNS, CharGEN, SNMP attacks, etc. |
| Layer 7 attacks  | floods GET/POST requests |

### CloudTrail
| Title | Description |
| ----- | ----------- |
| Overview | You can identify which users and accounts called AWS, the source IP address from which the calls were made, and when the calls occurred. |
| | Remember that CloudTrail is basically just CCTV for your AWS account. It logs all API calls made to your AWS account and stores these logs in S3. |

### AWS Shield
| Title | Description |
| ----- | ----------- |
| Overview | Protects all AWS customers on Elastic Load Balancing (ELB, Amazon CloudFront, and Route 53. <br/> Protects against SYN/UDP floods, reflection attacks, and other Layer 3 and Layer 4 attacks. |

### AWS WAF
| Title | Description |
| ----- | ----------- |
| Overview | AWS WAF is a web application firewall that lets you monitor the HTTP and HTTPS requests that are forwarded to Amazon CloudFront or an Application Load Balancer. |
| Define conditions | IP addresses, Country, Values(Headers), Presence of SQL code & scripts, Strings(regex patterns)|

### GuardDuty
| Title | Description |
| ----- | ----------- |
| Overview | GuardDuty is a threat detection service that uses machine learning to continuously monitor for malicious behavior. |

### Macie
| Title | Description |
| ----- | ----------- |
| Overview | Macie uses AI to analyze data in S3 and helps identify PII, PHI, and financial data. Automate remediation actions using other AWS services, such as Step Functions. |
| PII(PERSONALLY IDENTIFIABLE INFORMATION) | |
| Automated Analysis of Data | Macie uses machine learning and pattern matching to discover sensitive data stored in S3.|

### Amazon Inspector
| Title | Description |
| ----- | ----------- |
| Overview | helps improve the security and compliance of applications deployed on AWS. Amazon Inspector automatically assesses applications for vulnerabilities or deviations from best practices. |
|  Assessment Findings | After performing an assessment, Amazon Inspector produces a detailed list of security findings prioritized by level of severity. |
| 1. Network Assessments| Inspector agent is not required. Network configuration analysis to checks for ports reachable from outside the VPC |
| 2. Host Assessments | Inspector agent is required. Vulnerable software (CVE, host hardening (CIS Benchmarks), and security best practice|


### AWS KMS
| Title | Description |
| ----- | ----------- |
| Overview | KMS makes it easy for you to create and control the encryption keys used to encrypt your data. |
| Integration | AWS KMS is integrated with other AWS services such as EBS, S3 and RDS |
| CMK | You control the lifecycle of the CMK as well as who can use or manage it. |
| HSM |  A hardware security module (HSM) is a physical computing device that safeguards and manages digital keys and performs encryption and decryption functions.|
| 3 Ways to Generate a CMK | * own key management infrastructure, * generated within HSMs, * AWS CloudHSM cluster  |
| Key Rotation | You can choose to have AWS KMS automatically rotate CMKs every year, provided that those keys were generated within AWS KMS HSMs. |
| Policies | Policies attached to an IAM identity are called identity- based policies (or IAM policies), and policies attached to other kinds of resources are called resource-based policies. |
| KSM vs CloudHSM | For CloudHSM: Dedicated HSM to you, No automatic key rotation and full control of underlying hardware|

### Secrets Manager
| Title | Description |
| ----- | ----------- |
| Overview | is a service that securely stores, encrypts, and rotates your database credentials and other secrets |

### Parameter Store
| Title | Description |
| ----- | ----------- |
| Overview | is a capability of AWS Systems Manager that provides secure, hierarchical storage for configuration data management and secrets management. and free, no key rotation, limited 10,000|

### Presigned URL for S3
| Title | Description |
| ----- | ----------- |
| Overview | Sharing private files in your S3 buckets |
| CLI | aws s3 ls; aws s3 presign s3://../object-name --expires-in 3600 |

### Advanced IAM Policy
| Title | Description |
| ----- | ----------- |
| ARN structure | arn:partition:service:region:account_id: ex) arn:aws:iam::123456789012:user/woo  :: omitted because not region |
| IAM Policies | JSON, Identity & Resource Policy, List of statements |
| Permission Boundaries | Used to delegate administration to other users |

### Certificate Manager
| Title | Description |
| ----- | ----------- |
| Overview | AWS Certificate Manager is a free service that saves time and money. Automatically renew your SSL certificates and rotate the old certificates with new certificates with supported AWS services. |

## Automate
Why Use Automation? Time, Consistency, Security 
### CloudFormation
| Title | Description |
| ----- | ----------- |
| Overview | CloudFormation is perfect for creating immutable architecture. |
### Elastic Beanstalk
| Title | Description |
| ----- | ----------- |
| Overview | Platform as a Service (PaaS) is a single-stop application deployment model. |
### Systems Manager
| Title | Description |
| ----- | ----------- |
| Feature | Automation Documents, Run Command, Patch Manager, Parameter Store, Hybrid Activations, Session Manager |

## Caching
| Title | Description |
| ----- | ----------- |
| Overview | Caches go in front of everything. Internal vs. External|
| CloudFront | is a fast content delivery network (CDN) service that securely delivers data, videos, applications, and APIs to customers globally. It helps reduce latency and provide higher transfer speeds using AWS edge locations. |
| CloudFront settings | Security, Global Distribution, Endpoint Support, Expiring Content |
| ElastiCache(RDS) | ElastiCache is a managed version of 2 open- source technologies: Memcached(Simple) and Redis(Caching Solution). |
| DynamoDB Accelerator (DAX) | In-Memory Cache, Location, You're in Control |
| Global Accelerator |  is a networking service that sends your users’ traffic through AWS’s global network infrastructure. It can increase performance and help deal with IP caching. |

## Governance
| Title | Description |
| ----- | ----------- |
| AWS Organizations | is a free governance tool that allows you to create and manage multiple AWS accounts. With it, you can control your accounts from a single location rather than jumping from account to account. |
| Service Control Policies (SCP )| Once   implemented,these policies will be applied to every single resource inside an account. They are the ultimate way to restrict permissions, and even apply to the root account. |
| AWS RAM | Resource Access Manager is a free service that allow you to share AWS resources with other accounts |
|  RAM vs. VPC Peering | Are you sharing resources within the same region? Use RAM. Are you sharing across regions? Use VPC peering. |
| AWS SSO | User Identities, Universal Hooks, Compatibility|
| Cognito | User Pools, Federation, Access Control |
| | focus on picking authentication problem Cognito to solve any sort of mobile authentication problem and SSO to manage user access
to multiple AWS accounts in an Organization |
| Cross-Account Role Access | As the number of AWS accounts you manage increases, you’ll need to set up cross-account access. Duplicating IAM accounts creates a security vulnerability. Cross-account role access gives you the ability to set up temporary access you can easily control. |
| Config | is an inventory management and control tool. It allows you to show the history of your infrastructure along with creating rules to make sure it conforms to the best practices you’ve laid out. |
| Directory Service? | is a fully managed version of Active Directory. It allows you to offload the painful parts of keeping AD online to AWS while still giving you the full control and flexibility AD provides. |
| AWS Cost Explorer |  is an easy-to-use tool that allows you to visualize your cloud costs. You can generate reports based on a variety of factors, including resource tags. |
| | AWS Budgets allows organizations to easily plan and set expectations around cloud costs. You can easily track your ongoing spend and create alerts to let users know when they’re close to exceeding their allotted spend. |
| | AWS Trusted Advisor is a fully managed best-practice auditing tool. It will scan 5 different parts of your account and look for places where you could improve your adoption of the recommended best practices provided by AWS. |
| | |

