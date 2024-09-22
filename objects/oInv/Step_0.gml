/// @description Insert description here
// You can write your code in this editor

//Levels
if (souls >= levelNext) and (levelCurrent < 10)
{
sodas++;
levelCurrent++;
souls -= levelNext;
levelNext = round(levelNext*1.20);
}

//Health
hpMissing = oInv.hpMax - oInv.hp;