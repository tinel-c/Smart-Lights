ip = wifi.sta.getip()
print(ip)
--nil
wifi.setmode(wifi.STATION)
wifi.sta.config("Tinel_home_2","[reteaualuitinel]")
ip = wifi.sta.getip()
print(ip)

-- set output to the relees
gpio.mode(0, gpio.OUTPUT)
gpio.mode(1, gpio.OUTPUT)

while 1 do
    adc_val = adc.read(0)
    print(adc.read(0))
    adc_val = math.floor((adc_val / 100)) % 2
    print(adc_val)
    tmr.delay(1000000)
    if (adc_val / 100) % 2 == 0 then
        gpio.write(1, gpio.LOW)
        gpio.write(0, gpio.HIGH)
    else
        gpio.write(0, gpio.LOW)
        gpio.write(1, gpio.HIGH)
    end
end
print(gpio.read(1))
print(adc.read(0))