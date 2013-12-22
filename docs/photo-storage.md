# Photo Storage

For the first version [Amazon S3](http://aws.amazon.com/s3/) will be used for photo storage.

## Getting Started

### Step 1 - Signup

Go to the [Amazon Web Services management console](https://console.aws.amazon.com), signing up if necessary.

![Amazon Web Services management console](http://f.cl.ly/items/3i133Q440l3g25371D2a/AWS%20Management%20Console.jpg)

### Step 2 - Create S3 Bucket

Next create a new bucket in the [S3: Scalable Storage in the Cloud panel](https://console.aws.amazon.com/s3).

![S3: Scalable Storage in the Cloud](http://f.cl.ly/items/42423Y221W3a2O2P222L/S3%20Management%20Console.jpg)

### Step 3 - Create User With Bucket Access

Security should always be a concern, so the next step is creating a new user in the [IAM: Secure AWS Access Control panel](https://console.aws.amazon.com/iam) that only has access to the bucket we just created.

![IAM: Secure AWS Access Control](http://f.cl.ly/items/1M1p3s0i1S2B2y0L1J0s/IAM%20Management%20Console.jpg)

Save the new user credentials somewhere for later use when configuring foto photo store.

![save credentials](http://f.cl.ly/items/350P3b0f2W3W3V1r3g05/IAM%20Management%20Console-1.jpg)

Now apply a policy to the user that only gives it access to the the bucket you created.

1. Select the user
1. Click the Permissions tab
1. Click Attach User Policy
1. Select Custom Policy
1. Fill in policy name and then use the following policy (replacing `jonmagic-fotos` with your bucket name):

```
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::jonmagic-fotos",
        "arn:aws:s3:::jonmagic-fotos/*"
      ]
    }
  ]
}
```

The bucket is now setup and a user has been created that has read and write access to the bucket. Use the saved credentials to configure foto to use the new S3 bucket.
