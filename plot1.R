# Get the data in a data table called 'power_consumption_dt'
source( 'get_and_read_files.R' )

# Build the plot
hist ( 
    x = power_consumption_dt$Global_active_power
    , xlab = 'Global Active Power (kilowatts)'
    , ylab = 'Frequency'
    , col = 'red'
    , main = 'Global Active Power'
)

# Copy the plot to a .png file
dev.copy( png, 'plot1.png', width = 480, height = 480, units = 'px' )
dev.off()