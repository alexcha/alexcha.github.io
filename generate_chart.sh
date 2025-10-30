#!/bin/bash

# 1. 데이터 파싱 (견고하게 수정된 로직 유지)

# JS_VALUES: 쉼표로 구분된 값 (차트 데이터용 - 차트는 시간 순서대로 유지)
JS_VALUES=$(awk -F ' : ' '
    { 
        # 값에서 쉼표(,) 제거
        gsub(/,/, "", $2); 
        values[i++] = $2
    }
    END {
        # 배열의 요소를 ", "로 연결하여 출력 (선행/후행 공백 및 줄 바꿈 방지)
        for (j=0; j<i; j++) {
            printf "%s", values[j]
            if (j < i-1) {
                printf ", "
            }
        }
    }
' result.txt)

# JS_LABELS: 따옴표로 감싸고 쉼표로 구분된 시간 (차트 레이블용 - 차트는 시간 순서대로 유지)
JS_LABELS=$(awk -F ' : ' '
    { 
        # 시간에서 '날짜 시간:분'만 추출하여 레이블로 사용
        split($1, time_arr, " "); 
        short_label = time_arr[2] " " time_arr[3]; 
        labels[i++] = "\"" short_label "\""
    }
    END {
        # 배열의 요소를 ", "로 연결하여 출력
        for (j=0; j<i; j++) {
            printf "%s", labels[j]
            if (j < i-1) {
                printf ", "
            }
        }
    }
' result.txt)

# 2. HTML 테이블 생성 (표 데이터 역순 정렬 로직 유지)
HTML_TABLE_ROWS=$(tac result.txt | awk -F ' : ' 'BEGIN {
    # 테이블 시작 및 스타일 정의
    print "<table style=\"width: 100%; max-width: 1000px; border-collapse: collapse; border: 1px solid #ddd; font-size: 14px; min-width: 300px;\">";
    # 테이블 헤더
    print "<thead><tr><th style=\"padding: 12px; background-color: #e9ecef; border: 1px solid #ddd; text-align: left; color: #495057;\">시간 (KST)</th><th style=\"padding: 12px; background-color: #e9ecef; border: 1px solid #ddd; text-align: right; color: #495057;\">값</th></tr></thead>";
    print "<tbody>";
}
{
    # 데이터 행 (result.txt의 $1=시간, $2=값)
    printf "<tr><td style=\"padding: 10px; border: 1px solid #eee; text-align: left; background-color: white;\">%s</td><td style=\"padding: 10px; border: 1px solid #eee; text-align: right; font-weight: bold; color: #d9534f; background-color: white;\">%s</td></tr>\n", $1, $2
}
END {
    print "</tbody></table>";
}')

# 3. HTML 파일 생성 (index.html)
# 캐싱 방지용 타임스탬프 생성 로직 제거

cat << CHART_END > index.html
<!DOCTYPE html>
<html>
<head>
    <title>No..</title>
    <!-- 🚨 모바일 뷰포트 메타 태그 제거됨 -->
    <!-- Chart.js CDN 링크 (안정성을 위해 캐싱 방지 쿼리 파라미터 제거됨) -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>
    <style>
        body { font-family: 'Inter', Arial, sans-serif; margin: 0; background-color: #f7f7f7; color: #333; }
        .container { width: 95%; max-width: 1000px; margin: 20px auto; padding: 20px; background: white; border-radius: 12px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); }
        h1 { text-align: center; color: #333; margin-bottom: 5px; font-size: 24px; }
        p.update-time { text-align: center; color: #777; margin-bottom: 30px; font-size: 14px; }
        /* 차트 컨테이너 높이 관련 모바일 미디어 쿼리 제거됨 */
        #chartContainer { margin-bottom: 50px; border: 1px solid #eee; border-radius: 8px; padding: 10px; background: #fff; }
        h2 { margin-top: 40px; margin-bottom: 15px; text-align: center; color: #555; font-size: 20px; border-bottom: 2px solid #eee; padding-bottom: 10px;}
        /* 테이블 래퍼 관련 CSS 제거됨 */
    </style>
</head>
<body>
    <div class="container">
        <h1>스트리밍 이맨트 추이</h1>
        <p class="update-time">최근 업데이트 시간: $(tail -n 1 result.txt | awk -F ' : ' '{print $1}')</p>
        
        <!-- 차트 영역 -->
        <div id="chartContainer">
            <canvas id="simpleChart"></canvas>
        </div>
        
        <!-- 데이터 표 영역 -->
        <h2>데이터 기록 (최신순)</h2>
        <!-- 🚨 테이블 래퍼 제거됨 -->
        <div>
            ${HTML_TABLE_ROWS}
        </div>
    </div>
    
    <script>
    const chartData = [${JS_VALUES}];
    const chartLabels = [${JS_LABELS}];

    // 🚨🚨 디버깅을 위한 콘솔 로그 추가: 이 배열들을 브라우저 콘솔에서 확인해 주세요!
    console.log("Chart Data Array:", chartData);
    console.log("Chart Labels Array:", chartLabels);

    const ctx = document.getElementById('simpleChart').getContext('2d');
    
    // 🚨 모바일 높이 동적 설정 코드 제거됨
    /*
    if (window.innerWidth <= 600) {
        ctx.canvas.parentNode.style.height = '300px'; 
    }
    */

    if (chartData.length === 0) {
        console.error("Chart data is empty. Cannot render chart.");
        document.getElementById('chartContainer').innerHTML = "<p style='text-align: center; color: red; padding: 50px;'>데이터가 없어 차트를 그릴 수 없습니다.</p>";
    } else {
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: chartLabels,
                datasets: [{
                    label: '값 변화 추이',
                    data: chartData,
                    borderColor: 'rgba(255, 99, 132, 1)', 
                    backgroundColor: 'rgba(255, 99, 132, 0.4)',
                    borderWidth: 2,
                    tension: 0.3, 
                    pointRadius: 4,
                    pointBackgroundColor: 'rgba(255, 99, 132, 1)',
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false, // 컨테이너 크기에 맞춤
                scales: {
                    x: {
                        type: 'category', 
                        title: { display: true, text: '시간 (HH:MM KST)', font: { size: 14, weight: 'bold' } }
                    },
                    y: {
                        title: { display: true, text: '값', font: { size: 14, weight: 'bold' } },
                        beginAtZero: false,
                        ticks: {
                            callback: function(value) {
                                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        mode: 'index',
                        intersect: false,
                        callbacks: {
                            label: function(context) {
                                let label = context.dataset.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed.y !== null) {
                                    label += context.parsed.y.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                }
                                return label;
                            }
                        }
                    }
                }
            }
        });
    }
    </script>
</body>
</html>
CHART_END
