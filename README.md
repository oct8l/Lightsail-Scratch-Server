# AWS Lightsail scratch server

# What's the purpose of this repo?
I wanted a quick and easy way to deploy an AWS Lightsail instance and have it be a blank slate for me to tinker with.

## How do I use it?
Here is the "intended" way for this repo to be used:
1. Download the repo, optionally as a zip folder, and delete the folder after every time you set up the WireGuard server.
2. This repo assumes you have [https://direnv.net/](https://direnv.net/) installed to load and unload the `.envrc` files when changing directories. I'd recommend installing it, otherwise if you're so inclined, you can manage the environment variables through another package or manually.
3. Change to the new directory for the repo once you have the folder downloaded/unzipped/un-tar'd/etc.
4. Update your variables for your AWS region in `.envrc`. Ensure your AWS credentials are set up in the `~/.aws` folder as per the AWS CLI configuration. For help setting up these credentials, visit [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).
  * `direnv` should prompt you to allow the new `.envrc` file with an easy copy and pasteable error message! This will need to be done before running the scripts so the variables exist.
5. Finally, make the shell script(s) executable with `chmod +x *.sh`, and then turn up the server with `./run-all.sh`!

### Copy and pasteable commands for the trusting
```sh
wget https://github.com/oct8l/Lightsail-WireGuard-one-shot/archive/refs/heads/main.tar.gz
tar -xzf main.tar.gz
rm main.tar.gz
cd Lightsail-WireGuard-one-shot-main
chmod +x *.sh
vi .envrc
```
After you defeat the `vi` boss and have your variables set, you can run `./run-all.sh` and watch the magic happen!

You can also optionally run `./ssh.sh` if you'd like to SSH to the machine, it will use the SSH key that was generated by the previous script.

## Extra info
The Terraform template also applies the needed firewall rules and assigns the machine to that firewall group, so no need to manually allow it. It makes port 22/tcp accessible from any IPv4 address.
