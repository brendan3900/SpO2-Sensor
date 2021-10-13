# SpO2-Sensor
Using an Arduino Uno and a MAX30105 sensor to gather data; SpO2 value calculated by running data through a MATLAB algorithm which implements a linear regression.


In this repository, you will see an INO file. This file, when uploaded to an Arduino UNO, will read data from a MAX30105 sensor and send it to the serial prompt. This comprises 
PPG waveform, or Photoplethysmography waveform, which is used to calculate oxygen saturation.
Data obtained through the Arduino UNO can be captured and put into a spreadsheet.

The MATLAB file in this repository takes the data from a spreadsheet, and uses a linear regression algorithm to calculate the SpO2 value over a given range.

Main Issues Faced:
The main issue I faced in this project was the data returned by the MAX30105 sensor. The sensor is fairly cheap, and doesn't always given a good PPG waveform, making it difficult
to test the algorithm. 
