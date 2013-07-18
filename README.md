# Pusher Rave

Pusher Rave is an awesome demo Rich Caudle created to show off Pusher's power for engaging audiences.

The application detects beats in an audio stream and pushes colours to audiences member's mobile phones, creating a light show. Think small scale London Olympic opening ceremony!

Beat detection is carried out in Processing using Minim:BeatDetect. Each time a beat is detected a colour change is pushed on to a Pusher channel. This proportion is run on the server. 

Audenience member open up a mobile optimised web page, which connects them and subscribes them to the appropriate Pusher channel. When a new colour is received this colour is displayed on the page.