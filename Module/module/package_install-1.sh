#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Second Page Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
echo "<div class="tenor-gif-embed" data-postid="12393305" data-share-method="host" data-width="100%" data-aspect-ratio="1.4351585014409223"><a href="https://tenor.com/view/brahmi-telugu-telugu-funny-rangu-paduddhi-gif-12393305">Brahmi Telugu GIF</a> from <a href="https://tenor.com/search/brahmi-gifs">Brahmi GIFs</a></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>" | sudo tee /var/www/html/index.html
