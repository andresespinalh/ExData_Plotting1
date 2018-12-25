# Get the data in a data table called 'power_consumption_dt'
source( 'get_and_read_files.R' )

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

# Copy the plot to a .png file
dev.copy( png, 'plot3.png', width = 480, height = 480, units = 'px' )
dev.off()