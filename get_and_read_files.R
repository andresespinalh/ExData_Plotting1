library( data.table )

zipped_file_name <- 'household_power_consumption.zip';

# Download the file and unzip it only if it doesn't exist in the working directory
if( !file.exists( zipped_file_name ) ) {
    download.file( 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = zipped_file_name, method = 'curl' )
    unzip( zipped_file_name )
}

file_name <- 'household_power_consumption.txt'

# Read the file using fread() for fast reads, ? character represents NA's
power_consumption_dt <- fread( file = file_name, sep = ';', na.strings = '?' )

# Engineer a new POSIXct date column using the 'Date' and 'Time columns'
dates <- paste( power_consumption_dt$Date, power_consumption_dt$Time )
dates <- as.POSIXct( dates, format = '%d/%m/%Y %H:%M:%S' )

# Apply the filters to the generated dates to get a logical vector
filter_date_start <- as.POSIXct( '2007-02-01', format = '%Y-%m-%d' )
filter_date_end <- as.POSIXct( '2007-02-03', format = '%Y-%m-%d' )
included_dates <- dates >= filter_date_start & dates <= filter_date_end

# Get the subsetted data table with the engineered POSIXct date column
power_consumption_dt <- power_consumption_dt[ included_dates, .('Date_time' = dates[included_dates], Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3)]
