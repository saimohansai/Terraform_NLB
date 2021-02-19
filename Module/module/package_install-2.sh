#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Third Page Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
echo "<div class="tenor-gif-embed" data-postid="18823400" data-share-method="host" data-width="100%" data-aspect-ratio="1.2235872235872236"><a href="https://tenor.com/view/em-cheddham-antav-mari-kcr-gif-what-what-can-we-do-gif-18823400">Em Cheddham Antav Mari Kcr GIF</a> from <a href="https://tenor.com/search/emcheddhamantavmari-gifs">Emcheddhamantavmari GIFs</a></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script>" | sudo tee /var/www/html/index.html
