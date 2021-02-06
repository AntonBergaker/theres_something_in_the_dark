///@interface
///@hint ILight extends instance
function ILight() {
	displayLightRange = 0; ///@is {number}
	displayLightStrength = 0; ///@is {number}
	displayLightOffsetX = 0;
	displayLightOffsetY = 0;
}

global.ILightables = [oPlayer, oFire]; ///@is {Array<ILight>}