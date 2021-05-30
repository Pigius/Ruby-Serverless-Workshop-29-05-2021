# Ruby Serverless Workshop 29 May 2021

#### Repository for the purpose of the Ruby Serverless workshop (details [here](https://www.danielaniszkiewicz.com/aws-serverless-ruby-workshop.html))


### Inside the project there is also a short presentation.


The application was developed during a workshop lasting several hours. It's a scalable back-end application made using Serverless Framework with Ruby. The app allows you to place pizza orders as well as preview all orders.

- Orders are stored in the DynamoDB NoSQL database.
- For computing the logic, we've used AWS Lambda.
- For the API part, we've used AWS API Gateway.
- For the purpose of assembling all the elements, we've used Serverless Framework.
- For bundling Ruby gems, we've used a serverless plugin [https://www.npmjs.com/package/serverless-ruby-layer](https://www.npmjs.com/package/serverless-ruby-layer)

  
## Project Setup

Make sure, that you have your AWS credentials setup in ~/.aws/credentials file. It should look like:
```
[personal]
aws_access_key_id = access
aws_secret_access_key = secret
region = eu-central-1
```

- Ruby version is `2.7`
- default region is `eu-central-1`
- AWS profile is `personal`

### Installation
- `npm ci`

### Deploying to AWS
- `AWS_PROFILE=personal sls deploy `
- For deploying single function changes (and avoid waiting for deploying the whole project again and again) it's worth using the command `AWS_PROFILE=personal sls deploy -f function-name -v`

### Deleting stack
`sls remove`

### Testing with Postman
- after the deployment, simply grab endpoints generated by Serverless Framework, and copy them to the postman, when you can create a collection for the purposes of the E2E tests.
 