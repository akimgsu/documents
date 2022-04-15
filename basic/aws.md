# AWS

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
| | |
| | |
| | |
| | |
| | |
| | |
| | |

