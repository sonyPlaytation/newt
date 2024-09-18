/// @description Insert description here
// You can write your code in this editor

if (souls >= levelNext) and (levelCurrent < 10)
{
sodas++;
levelCurrent++;
souls -= levelNext;
levelNext = round(levelNext*1.20);
}
