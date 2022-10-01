#!/bin/bash

echo "Let's create a Vanilla Web project. Enter a name for the project..."

read PNAME

mkdir $PNAME

touch $PNAME/index.html
touch $PNAME/style.css
touch $PNAME/script.js

cat > $PNAME/index.html <<- EOM
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$PNAME</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Welcome to $PNAME</h1>
<script src="script.js"></script>
</body>
</html>
EOM

cat > $PNAME/style.css <<- EOM
* {
  box-sizing: border-box;
}
EOM

cat > $PNAME/script.js <<- EOM
alert('Script file loaded');
EOM

echo "Created Vanilla project $PNAME, to go there type 'cd $PNAME'"