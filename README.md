Execution Order Summary
Apply backend-setup.tf locally to create the S3 bucket.

Commit the vpc/ and ec2/ folders to your AWS CodeCommit repo and run git tag v1.0.0 && git push origin v1.0.0.

In your Root Deployment Project folder, run terraform init, followed by terraform plan and terraform apply.
