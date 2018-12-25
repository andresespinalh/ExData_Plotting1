# Get the data in a data table called 'power_consumption_dt'
source( 'get_and_read_files.R' )

# Build the plot
plot (
    x = power_consumption_dt$Date_time
    , y = power_consumption_dt$Global_active_power
    , type = 'l'
    , xlab = ''
    , ylab = 'Global Active Power (kilowatts)'
)

# Copy the plot to a .png file
dev.copy( png, 'plot2.png', width = 480, height = 480, units = 'px' )
dev.off()