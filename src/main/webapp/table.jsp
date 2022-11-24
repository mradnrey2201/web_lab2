<%@ page import="com.example.lab_2.models.Point" %>
<%@ page import="com.example.lab_2.state.State" %>
<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/flexboxgrid2@7.2.1/flexboxgrid2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <title>Table</title>
</head>
<body>
<div style="display:flex;">
    <a href="/"
       style="font-size: 20px;
       color: #ffffff;
       background: teal;
       padding: 10px;
       border-radius: 10px;
       margin: 10px;
       text-decoration: none;">
        To the main page
    </a>
</div>
<div style="max-width: 1150px; margin: 0 auto;">
    <div class="row between-xs">
        <div class="col-lg-6 col-md-12" style="margin-bottom: 30px;">
            <div class="main__graph">
                <svg
                        style="border: 1px solid #000; box-sizing: border-box; width: 400px; height: 400px"
                        id="graph"
                        viewBox="-50 -50 400 400"
                        xmlns="http://www.w3.org/2000/svg"
                >
                    <!-- circle -->
                    <path
                            class="graph-shape"
                            d="M 250 150 A 200 200, 0, 0, 1, 150 250 L 150 150 Z"
                    />

                    <!-- triangle -->
                    <polygon class="graph-shape" points="150,200 150,150 50,150"/>

                    <!-- rectangle -->
                    <polygon
                            class="graph-shape"
                            points="200,50 200,150 150,150 150,50"
                    />

                    <!-- axles -->
                    <text class="graph-axle-text" x="290" y="140">x</text>
                    <line
                            class="graph-axle-line"
                            x1="0"
                            x2="295"
                            y1="150"
                            y2="150"
                    />
                    <polygon
                            class="graph-axle-arrow"
                            points="299,150 290,155 290,145"
                    />

                    <text class="graph-axle-text" x="160" y="10">y</text>
                    <line
                            class="graph-axle-line"
                            x1="150"
                            x2="150"
                            y1="5"
                            y2="300"
                    />
                    <polygon
                            class="graph-axle-arrow"
                            points="150,1 145,10 155,10"
                    />

                    <!-- points -->
                    <line class="graph-point" x1="50" x2="50" y1="145" y2="155"/>
                    <line class="graph-point" x1="100" x2="100" y1="145" y2="155"/>
                    <line class="graph-point" x1="200" x2="200" y1="145" y2="155"/>
                    <line class="graph-point" x1="250" x2="250" y1="145" y2="155"/>

                    <line class="graph-point" x1="145" x2="155" y1="250" y2="250"/>
                    <line class="graph-point" x1="145" x2="155" y1="200" y2="200"/>
                    <line class="graph-point" x1="145" x2="155" y1="100" y2="100"/>
                    <line class="graph-point" x1="145" x2="155" y1="50" y2="50"/>

                    <!-- labels -->
                    <text
                            class="graph-label r-whole-neg"
                            text-anchor="middle"
                            x="50"
                            y="140"
                    >
                        -R
                    </text>
                    <text
                            class="graph-label r-half-neg"
                            text-anchor="middle"
                            x="100"
                            y="140"
                    >
                        -R/2
                    </text>
                    <text
                            class="graph-label r-half-pos"
                            text-anchor="middle"
                            x="200"
                            y="140"
                    >
                        R/2
                    </text>
                    <text
                            class="graph-label r-whole-pos"
                            text-anchor="middle"
                            x="250"
                            y="140"
                    >
                        R
                    </text>

                    <text
                            class="graph-label r-whole-neg"
                            text-anchor="start"
                            x="160"
                            y="255"
                    >
                        -R
                    </text>
                    <text
                            class="graph-label r-half-neg"
                            text-anchor="start"
                            x="160"
                            y="205"
                    >
                        -R/2
                    </text>
                    <text
                            class="graph-label r-half-pos"
                            text-anchor="start"
                            x="160"
                            y="105"
                    >
                        R/2
                    </text>
                    <text
                            class="graph-label r-whole-pos"
                            text-anchor="start"
                            x="160"
                            y="55"
                    >
                        R
                    </text>
                    <%
                        State state = (State)request.getAttribute("state");
                        if (state.contains(session.getId())) {
                            for (Point dot : state.getList(session.getId())) {
                                double convX = (dot.getX() / dot.getR()) * 100 + 150;
                                double convY = -((dot.getY() / dot.getR()) * 100) + 150;
                    %>
                    <circle cx="<%=convX%>" cy="<%=convY%>" r="2" class="dot dot-active"/>
                    <%
                            }
                        }
                    %>
                    <!-- ====================================================================================== -->
                </svg>
            </div>
        </div>
        <div class="col-lg-6 col-md-12">
            <div class="history">
                <table>
                    <thead>
                    <tr>
                        <th>X value</th>
                        <th>Y value</th>
                        <th>R value</th>
                        <th>Area hit</th>
                        <th>Current time</th>
                        <th>Execution time</th>
                    </tr>
                    </thead>
                    <tbody id="result-table-body">
                    <%
                        if (state.contains(session.getId())) {
                            for (Point point : state.getList(session.getId())) {
                    %>
                    <tr style='text-align: center;'>
                        <td><%= point.getX()%>
                        </td>
                        <td><%= point.getY()%>
                        </td>
                        <td><%= point.getR()%>
                        </td>
                        <td><%= point.isHitted()%>
                        </td>
                        <td><%= point.getCurrentTime()%>
                        </td>
                        <td><%= point.getExecutionTime()%> ms</td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>