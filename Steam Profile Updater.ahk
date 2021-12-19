f12:: 

;Setup 
SetTitleMatchMode, 2
DetectHiddenWindows, On 

Loop
{
	;Data collection 
	UrlDownloadtoFile, https://howlongagogo.com/date/2015/july/19, %A_ScriptDir%\timesince.txt
	FileReadLine, TimeSince, %A_ScriptDir%\timesince.txt, 433
	Loop, Parse, TimeSince
		{
			If A_LoopField is Number
			NewVar .= A_LoopField
		}
	Num := NewVar - 22000000000 
	VarSetCapacity( fNum,32 )
	DllCall( "GetNumberFormat",UInt,0x0409,UInt,0,Str,Num,UInt,0,Str,fNum,Int,32 )
	StringTrimRight, fNum, fNum, 3
	FormatTime, TimeString
	NewProfileBio = %FNum% seconds on Steam and counting...`nTime last fetched at %TimeString% (PST)`n[i]Autosteam profile updater by me :-)[/i]

	;Steam Interaction 
	Click, 1014, 476
	SendInput, ^a
	SendInput, {backspace} 
	SendInput, %NewProfileBio%
	Click, 1482, 823
	Sleep, 600000
}
