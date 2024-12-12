const ctx = document.getElementById('doanhThuChart');
const DATA_COUNT = 6;
const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 10000000};

function renderChart(months, revenues) {
    const labels = months.map(m => "Tháng " + m);
    const data = {
        labels: labels,
        datasets: [{
            label: 'Lợi nhuận',
            data: revenues,
            borderColor: '#A7D397',
            backgroundColor: '#A7D397'
        },
        ]
    };
    const config = {
        type: 'bar',
        data: data,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                }
            }
        },
    };
    new Chart(ctx, config);
}