#!/bin/bash
#
phone='+34 623105464'
email='sunnyhouses@gmail.com'
file=indexFR.html
if [ -e $file ]
then
  echo "HTML $file deleted"
  rm $file
fi

##Create HTML page
title=$1
cat >> ./$file <<HEAD
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>KioskFrance</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/extraStyles.css">
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <header>
    <h1>WhatsApp: $phone</h1>
    <p><span class="desc">$email</span></p>
  </header>
  <div class="bss-slides num1" id="canvas" tabindex="1" autofocus="autofocus">
HEAD

for i in img/*.png
do
if [ -e $i ]
then
echo "Adding img/$i"
cat >> ./$file <<HTML
    <figure>
		  <img src="$i" width="100%" /><figcaption>"Ejemplo $i" by Huss</figcaption>
    </figure>
HTML
fi
done

for i in img/*.jpg
do
if [ -e $i ]
then
echo "Adding img/$i"
cat >> ./$file <<HTML
    <figure>
		  <img src="$i" width="100%" /><figcaption>"Ejemplo $i" by Huss</figcaption>
    </figure>
HTML
fi
done

cat >>./$file<<FOOT
  </div> <!-- // bss-slides -->
  <script type='text/javascript' src='js/jquery-3.5.1.js'></script>
  <script type='text/javascript' src="js/slideshow.js"></script>

  <script>
    var opts = {
      auto: {
        speed: 3500,
        pauseOnHover: false
      },
      fullScreen: true,
      swipe: false
    };
    makeBSS('.num1', opts);

  </script>
</body>

</html>
FOOT

echo "HTML created and written to $file"