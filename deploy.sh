# copy all the content of the build/web folder into the github.io folder
rps build
cp -r build/web/* /Users/michelebenedetti/Documents/Work/Michele-x98.github.io
cd /Users/michelebenedetti/Documents/Work/Michele-x98.github.io
git add .
# get current date
now=$(date)
git commit -m "deploy $now"
git push
echo "Deployed successfully!"
# open michelebenediti.it
open http://michelebenedetti.it
