# Surviving Halloween
This repository contains all the example code for the Crazy Data Science - Surviving Halloween project.
(https://www.youtube.com/watch?v=wKt3EwHgRtM)


## Reproducing the examples from the start
You can follow the steps inside the Runbook.txt document to create the Azure Machine Learning experiment we showed in the video.
You can get a free AzureML subscription through this webpage: https://studio.azureml.net/.

Remember to upload the "horror_deaths_Halloween.csv" dataset which is in the Data folder of this repository.

To recreate the Shiny frontend make sure you have installed the Shiny library in your R workspace.
Then modify the "Server.R" file in Frontend folder to include your API key and web URL that you recieved when you created the Predictive Experiment in AzureML.
After thats done, execute the code in the "Shiny_Frontend.R" file to load the Shiny webpage and if everything is set up correctly you should recieve a predicted value back from the AzureML web service you created!







