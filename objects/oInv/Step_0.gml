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

if inBelly > 0{full = true}else full = false;

sinewave = 0.1 + (1+sin(2*pi*current_time/1000 * 0.30)) * 0.2;