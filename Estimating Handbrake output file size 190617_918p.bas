OPEN "a", #1, "output.txt"
start$ = "Start session " + DATE$ + " " + TIME$
'PRINT "start$ = "; start$
WRITE #1, start$
PRINT "Estimating Handbrake Output File Length"
PRINT "This program gives you 2 estimates Big and Small of the size of the output"
PRINT "file created by Handbrake from your source video. The source video is the"
PRINT "video you are processing in Handbrake. First we must determine the length"
PRINT "of your source video in seconds so lets say your source video is 2 hours"
PRINT "22 minutes and 32 seconds long usually represented as 2:22:32."
PRINT "So you will be asked: How many hours? to which you would enter 2, How many"
PRINT "minutes? to which you would enter 22 and How many seconds? to which you"
PRINT "would enter 32. Next we will ask you for the size in kilobytes of a 10"
PRINT "second preview of your source video which you will generate in Handbrake. So"
PRINT "load the source file into Handbrake, designate youre destination directory"
PRINT "and do a 10 second preview... Look in the destination directory and find out"
PRINT "what size the generated Preview is in kilobytes by looking in the destination"
PRINT "directory and enter it in. So lets say its 344kb you will be asked: Preview"
PRINT "size in kilobytes? To which you will enter 344"
EstimatingHandbrakeOutputFileLength:
PRINT "How many hours?"
INPUT hrs
PRINT "How many minutes?"
INPUT mins
PRINT "How many seconds?"
INPUT secs
SourceVideoLength = (hrs * 3600) + (mins * 60) + secs
ReestimatingSameVideo:
PRINT "Preview size in kilobytes?"
INPUT PreviewVideoSize
SmallEstimate = (PreviewVideoSize * SourceVideoLength) / 10000
BigEstimate = SmallEstimate * 1.3
PRINT SmallEstimate; "mb = Small Estimate"
PRINT BigEstimate; "mb = Big Estimate"
WRITE #1, "SourceVideoLength = ", SourceVideoLength, " PreviewVideoSize = ", PreviewVideoSize
WRITE #1, SmallEstimate, "mb = Small Estimate ", BigEstimate, "mb = Big Estimate"
PRINT "Press Enter to continue or type q then Enter to quit..."
LINE INPUT quit$
IF UCASE$(quit$) = "Q" THEN
    end$ = "End session " + DATE$ + " " + TIME$
    WRITE #1, end$
    'PRINT "end$ = "; end$
    CLOSE #1
    END
END IF
LINE INPUT "Is this a different video y/n? "; an$
IF UCASE$(an$) = "Y" THEN GOTO EstimatingHandbrakeOutputFileLength
GOTO ReestimatingSameVideo
'PRINT "hrs= "; hrs; "* "; "mins= "; mins; "* "; "secs= "; secs; "* "; "SourceVideoLenth= "; SourceVideoLenth; "*"
'PRINT "PreviewVideoSize= "; PreviewVideoSize; "* SourceVideoLenth= "; SourceVideoLenth
'PRINT "PreviewVideoSize * SourceVideoLenth= "; PreviewVideoSize * SourceVideoLenth

