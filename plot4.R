# Get the data in a data table called 'power_consumption_dt'
source( 'get_and_read_files.R' )
################################################## LAYOUT SETUP

# Create a 2 rows by 2 columns layout
par( mfrow = c( 2, 2 ) )

################################################## PLOT 1 

# Build the plot
plot (
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Global_active_power
    , type = 'l'
    , xlab = ''
    , ylab = 'Global Active Power (kilowatts)'
)

################################################## PLOT 2

# Build the plot
plot (
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Voltage
    , type = 'l'
    , xlab = 'datetime'
    , ylab = 'Voltage'
)    

################################################## PLOT 3 

# Build the plot
plot (
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Sub_metering_1
    , type = 'n'
    , xlab = ''
    , ylab = 'Energy sub metering'
)

# Sub_metering_1 line
lines ( 
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Sub_metering_1
)

# Sub_metering_2 line
lines ( 
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Sub_metering_2
    , col = 'red'
)

# Sub_metering_3 line
lines ( 
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Sub_metering_3
    , col = 'blue'
)

# Legend annotations
legend (
    x = 'topright'
    , legend = c( 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3' )
    , lty = c( 1, 1, 1 )
    , col = c( 'black', 'red', 'blue ')
)

################################################## PLOT 4

# Build the plot
plot (
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Global_reactive_power
    , type = 'l'
    , xlab = 'datetime'
    , ylab = 'Global_reactive_power'
)

################################################## FILE GENERATION

# Copy the plot to a .png file
dev.copy( png, 'plot4.png', width = 480, height = 480, units = 'px' )
dev.off()