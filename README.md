# MATLAB_RockPaperScissors
MATLAB Deep Learning Session Files</br>
Link to matlab drive: 
https://drive.matlab.com/sharing/e3f8c4c7-6a26-4f2b-9a2b-1193de247686/

<img width="1064" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/1ea5dcfa-d199-4fab-b7bb-26c3be78a95c">

Beginner's MATLAB Intro to Deep Learning Session. 

Make sure you have a MATLAB Login! Use your University Email to activate!!!



## Instructions:

### 1. First open the files in MATLAB Online (or local if you have it installed)
<img width="626" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/2cc6b695-e5be-4fe7-803a-e95d544a6d40">

### 2. Select "Copy Folder"
<img width="446" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/dd39ec62-47a8-4bad-b77b-47911a368ec5">

### 3. [WEBCAM] Open collect_images_via_webcam.m and run
<img width="922" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/a0083cd7-7def-4fd0-b6ae-18fe41cbd430">

[NO WEBCAM] Take pictures of ROCK, PAPER, SCISSORS, NULL class with your mobile phone. Upload images to ./data/CLASS

### 4. Collect 20-30 Images of each class. Move your hands in different areas.
![rock_2023-11-13_16-04-35_534](https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/76aebc34-e728-442d-aeb9-beee03c18117)


### 5.  Open transfer_learning.mlx
<img width="1118" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/bc5a1a4c-25c1-4cd0-b6a8-5742e704fdd1">

### 6.  Seleect "APPS", then "Deep Network Designer" in the dropdown menu
<img width="1133" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/34e0c364-8192-4acf-8b52-aeaf52f5d417">

### 7. Select googlenet in the Deep Network Designer
<img width="874" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/973273b7-07ff-49bf-841d-2ac2ffea05cc">

### 8. Delete loss-3-classifier layer
<img width="900" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/74dc45ed-02ad-4991-aa97-fa06fbb37668">

### 9. Replace with fullyConnectedLayer
<img width="895" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/c768bd8f-d1db-441c-940b-0b22760bf35e">


### 10. Change Output Class to 4
<img width="902" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/119d8021-8e1c-4b9c-8f70-4117ed1c295f">

### 11. Unlock output layer and select export
<img width="902" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/7bac88a0-cbc3-4384-bf30-efae5f364d36">

### 12. lgraph_1 should be visible in the bottom right. Select Run in live editor
<img width="1115" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/9c8163e1-dfe0-4dbd-99d4-dd4d45349516">

### 13. Training will start. 
<img width="1046" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/adc44071-8a1c-4b2d-b695-fd62f4672678">
The accuracy should increase whilst loss decreases. Close when training has been complete.

### 14. Test network!
We can test the image on images taken on any device! Try an image taken with a webcam/phone, upload to PC and run the following: </br>

<code>inferImage(netTransfer, 'PATH_TO_YOUR_IMAGE')</code>

### 15. Run on Webcam
<img width="353" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/a992b974-ecc2-4bf2-8c35-881052372c04"> </br>
In the MATLAB Command Window, run the following: </br>
<code>run_network_on_webcam(netTransfer, 0.4)</code> </br>

<img width="1064" alt="image" src="https://github.com/andy8744/MATLAB_RockPaperScissors/assets/42409796/1ea5dcfa-d199-4fab-b7bb-26c3be78a95c">
Now we should get this.
