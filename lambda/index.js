// Use 'import' instead of 'require'
const { CloudWatchClient, PutMetricDataCommand } = require('@aws-sdk/client-cloudwatch');
const cloudwatch = new CloudWatchClient();

module.exports.handler = async (event) => {
    console.log('Received event:', JSON.stringify(event, null, 2));
    const metricData = {
        MetricData: [
            {
                MetricName: 'CustomMetricName', // Name of your custom metric
                Dimensions: [
                    {
                        Name: 'CustomDimension', // Name of your dimension (optional)
                        Value: 'DimensionValue'  // Value of your dimension (optional)
                    },
                ],
                Unit: 'Count',                // Unit of the metric (e.g., Seconds, Count, etc.)
                Value: 5,                     // Value to push to CloudWatch
            },
        ],
        Namespace: 'MyCustomNamespace'         // Namespace for your custom metric
    };

    console.log('Try lambda change after Architecture Demo...');
    console.log('Try lambda change ... 2');

    try {
        // Put the custom metric data to CloudWatch
        const command = new PutMetricDataCommand(metricData);
        await cloudwatch.send(command);
        console.log('Custom metric pushed to CloudWatch successfully');
        return {
            statusCode: 200,
            body: JSON.stringify('Metric pushed successfully'),
        };
    } catch (error) {
        console.error('Error pushing custom metric:', error);
        return {
            statusCode: 500,
            body: JSON.stringify('Failed to push metric'),
        };
    }
};
