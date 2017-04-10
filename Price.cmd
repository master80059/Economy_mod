rem created by master80059
rem used for determing prices of material outputs in the XLM format for config file
rem plus it will out put prices and other information in a txt file

Rem base value fixed number everything will be valued off of Default 1
Set BV=5.1
Rem Set tax for Buy
set TX=0.07
Rem set buy profit must be greater than 2 plus tax cost or you will lose money
set BP=12

rem buy formula *%BP%/%TX%

Rem  config Ore rarity
set StoneRarity=0.310
set IronOreRarity=0.500
set NickelOreRarity=0.020
set MagnesiunOreRarity=0.024
set ScrapOreRatity=0.700
set CobaltOreRarity=0.022
set SiliconOreRarity=0.020
set SilverOreRarity=0.020
set GoldOreRarity=0.020
set PlatinumOreRarity=0.020
set UraniumOreRarity=0.044
set IceRearity=0.02

rem  ore to material ratio

set StoneRatio=0.900
set CobaltRatio=0.300
set GoldRatio=0.010
set IronRatio=0.700
set ScrapRatio=0.800
set MagnesiumRatio=0.007
set NickelRatio=0.400
set PlatinumRatio=0.005
set SiliconRatio=0.700
set SilverRatio=0.010
set UraniumRatio=0.007

rem ingots Kg per second

set StoneTime=0.1
set IronTime=0.05
set ScrapTime=0.04
set SiliconTime=0.6
set NickelTime=2
set CobaltTime=4
Set SilverTime=1
Set GoldTime=0.4
Set MagnesiumTime=1
set UraniumTime=4
Set PlatinumTime=4

REM ore Buy Price 
set /a StoneIBuy=(%BV%/%StoneRatio%/%stoneRarity%* %StoneTime%*%BP%/%TX%)
set /a IronIBuy=%BV%/%IronRatio%/%IronRarity%*%IronTime%*%BP%/%TX%
set /a ScrapIBuy=%BV%/%ScrapRatio%/%ScrapRarity%*%ScrapTime%*%BP%/%TX%
set /a SiliconIBuy=%BV%/%SiliconRatio%/%SiliconRarity%*%SiliconTime%*%BP%/%TX%
set /a NickelIBuy=%BV%/%NickelRatio%/%NickelRarity%*%NickelTime%*%BP%/%TX%
set /a CobaltIBuy=%BV%/%CobaltRatio%/%CobaltRarity%*%CobaltTime%*%BP%/%TX%
set /a  SilverIBuy=%BV%/%SilverRatio%/%SilverRarity%*%SilverTime%*%BP%/%TX%
set /a GoldIBuy=%BV%/%GoldRatio%/%GoldRarity%*%GoldTime%*%BP%/%TX%
set /a MagnesiumIBuy=%BV%/%MagnesiumRatio%/%MagnesiumRarity%*%MagnesiumTime%*%BP%/%TX%
set /a UraniumIBuy=%BV%/%UraniumRatio%/%UraniumRarity%*%UraniumTime%*%BP%/%TX%
set /a PlatinumIBuy=%BV%*%PlatinumTime%/%PlatinumRatio%/%PlatinumRarity%*%BP%/%TX%


Rem bug check print to screen
@echo off

echo ore prices
echo  Stone %StoneIBuy%
echo iron %IronIBuy%
echo scrap %ScrapIBuy%
echo silicon %SiliconIBuy%
echo nickel %NickelIBuy%
echo cobalt %CobaltIBuy%
echo silver %SilverIBuy%
echo gold %GoldIBuy%
Echo magnesium %MagnesiumIBuy%
Echo uranium %UraniumIBuy%
Echo platinum %PlatinumIBuy%
pause