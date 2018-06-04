# sttr-tgdcc-caisis
Repo set up to coordinate CAISIS data dictionary versions

When new Fields, Descriptions, Disease specific dictionaries or other values in the file named `STTR_Caisis_Master Data Dictionary_06022018.xlsx` are updated, the following process needs to happen.


1.  Commit a new file to a new branch in the repo and overwrite the existing one (keep in mind that GitHub is tracking all changes so the old version is still available).  
2.  Run in R the script called `transformForOntology.R` and it will write out a new data set for the Ontology browser into the folder named `forOntology`.  Commit these changes to the branch as well.
3.  Once a sufficient number of edits have been made, all Fields have Descriptions and everything is double checked to be accurate and the group wants to do a "release" of the current dictionaries, we do a pull request.
4. The pull request can let us do a final review as well if desired before merging the changes into the master branch.  Once these changes are merged into the master, they will be accessible to the app the next time a person reloads it in their browser.
5. We can consider using the "releases" feature in GitHub and name the release with an official version number that we can expose to the Shiny app so people can see (including us) whether there have been updates to the dictionary since we last looked or not.  
