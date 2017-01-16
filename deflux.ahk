#SingleInstance

Loop{

PSExists := ProcessExist("Photoshop.exe") ; Load process state to variable
LRExists := ProcessExist("lightroom.exe") ; Load process state to variable
FluxExists := ProcessExist("flux.exe")    ; Load process state to variable


If  (PSExists != 0) or (LRExists != 0) { ; Do if PS or LR is open 
	Send !{End} ; First send disable for an hour keyboard hotkey to remove flux adjustments
	Sleep 6000  ; Wait 6 seconds for adjustments to be removed
	Process, Close, flux.exe ; Now close Flux
}

If (PSExists = 0) and (LRExists = 0) and (FluxExists = 0) ; Do if PS and LR are closed and Flux is not already running
	Run, C:\Users\%A_UserName%\AppData\Local\FluxSoftware\Flux\flux.exe ; Start Flux

Sleep, 10000 ; 10 second loop interval

}

ProcessExist(Name){
	Process,Exist,%Name% ; Check if process exists
	return Errorlevel ; If it is return the process PID, if not return 0
}
