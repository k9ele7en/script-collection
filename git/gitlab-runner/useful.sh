
# airflow forward port 80 to 8080
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080 # 8080 -> 8080

# gitlab runner:
cd repo_path
sudo chown -R gitlab-runner .git/


 # Add gitlab to known_hosts (scripts in .yaml)
  - mkdir -p ~/.ssh && chmod 700 ~/.ssh
  - ssh-keyscan -H gitlab.com >> ~/.ssh/known_hosts
  # Start the ssh agent and add the id_rsa private key
  # - sudo chmod 400 ~/.ssh/id_rsa
  - eval $(ssh-agent -s)
  - sudo ssh-add ~/.ssh/id_rsa

# set owner of main repo to gitlab-runner
sudo chown -R gitlab-runner:gitlab-runner *
sudo chown -R gitlab-runner:gitlab-runner repo-name/.*


# backup if chown not effect
sudo setfacl -m user:gitlab-runner:rwx repo-name/