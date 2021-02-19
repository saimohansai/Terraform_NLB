#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1> First Page Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
echo "<div class="tenor-gif-embed" data-postid="17296049" data-share-method="host" data-width="100%" data-aspect-ratio="1.7913669064748199"><a href="https://tenor.com/view/telugu-jabardasth-getup-srinu-comedy-etv-telugu-gif-17296049">Telugu Jabardasth GIF</a> from <a href="https://tenor.com/search/telugu-gifs">Telugu GIFs</a></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>" | sudo tee /var/www/html/index.html