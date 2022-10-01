#!/bin/bash

app=""
pname=""

while getopts ":n:a:" opt; do
  case $opt in
    n)
      pname="$OPTARG"
      ;;
    a)
      app="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [[ -z "$pname" ]]; then
  echo "Enter a pname for the project..."
  read pname
fi

mkdir $pname

touch $pname/index.html
touch $pname/style.css
touch $pname/script.js

cat > $pname/index.html <<- EOM
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta pname="viewport" content="width=device-width, initial-scale=1.0">
  <title>$pname</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Welcome to $pname</h1>
<script src="script.js"></script>
</body>
</html>
EOM

cat > $pname/style.css <<- EOM
* {
  box-sizing: border-box;
}
EOM

cat > $pname/script.js <<- EOM
alert('Script file loaded');
EOM

echo "Created Vanilla project $pname, to go there type 'cd $pname'"

if [[ -n "$app" ]]; then
  echo "Opening project with $app"
  $app $pname/
fi