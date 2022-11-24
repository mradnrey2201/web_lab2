<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://unpkg.com/flexboxgrid2@7.2.1/flexboxgrid2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <title>Vite + TS</title>
</head>
<body>
<header class="header">
    <div class="container">
        <div class="header__inner row center-xs">
            <p class="header__text">Dmitriev Andrey</p>
            <p class="header__text">Group: P32301</p>
            <p class="header__text">Variant: 3213500</p>
        </div>
    </div>
</header>
<div class="main">
    <div class="container">
        <div class="row between-xs">
            <div class="main__graph">
                <svg
                        style="border: 1px solid #000; box-sizing: border-box"
                        id="graph"
                        viewBox="0 0 300 300"
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
                    <!-- x-lines -->
                    <line
                            x1="16.7"
                            y1="300"
                            x2="16.7"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="1"
                    />
                    <line
                            x1="50"
                            y1="300"
                            x2="50"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="2"
                    />
                    <line
                            x1="83.3"
                            y1="300"
                            x2="83.3"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="3"
                    />
                    <line
                            x1="116.7"
                            y1="300"
                            x2="116.7"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="4"
                    />
                    <line
                            x1="183.3"
                            y1="300"
                            x2="183.3"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="5"
                    />
                    <line
                            x1="216.7"
                            y1="300"
                            x2="216.7"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="6"
                    />
                    <line
                            x1="250"
                            y1="300"
                            x2="250"
                            y2="0"
                            stroke-dasharray="3,3"
                            class="line dotted-line"
                            data-number="7"
                    />
                    <line
                            x1="250"
                            y1="300"
                            x2="150"
                            y2="300"
                            stroke-dasharray="3,3"
                            class="line"
                            id="x-pointer"
                    />
                    <line
                            x1="283.3"
                            y1="300"
                            x2="283.3"
                            y2="150"
                            stroke-dasharray="3,3"
                            class="line"
                            id="y-pointer"
                    />

                    <line
                            x1="16.7"
                            y1="300"
                            x2="16.7"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="1"
                    />
                    <line
                            x1="50"
                            y1="300"
                            x2="50"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="2"
                    />
                    <line
                            x1="83.3"
                            y1="300"
                            x2="83.3"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="3"
                    />
                    <line
                            x1="116.7"
                            y1="300"
                            x2="116.7"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="4"
                    />
                    <line
                            x1="183.3"
                            y1="300"
                            x2="183.3"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="5"
                    />
                    <line
                            x1="216.7"
                            y1="300"
                            x2="216.7"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="6"
                    />
                    <line
                            x1="250"
                            y1="300"
                            x2="250"
                            y2="0"
                            stroke-width="20"
                            stroke="transparent"
                            class="hidden-line inactive"
                            data-number="7"
                    />
                    <line
                            x1="0"
                            y1="150"
                            x2="300"
                            y2="150"
                            stroke="black"
                            stroke-dasharray="3,3"
                            id="y-line"
                    />
                    <circle cx="-30" cy="-30" r="2" class="dot dot-active"/>
                    <!-- ====================================================================================== -->
                </svg>
            </div>
            <form class="form" id="form" style="margin-top: 30px" method="POST" action="/">
                <div class="X-panel flex">
                    <h4 class="form__title">X value:</h4>
                    <label class="X-panel__label flex">
                        <input type="radio" value="-5" class="x-btn" name="x"/>
                        <span>-5</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input
                                type="radio"
                                value="-4"
                                class="x-btn" name="x"
                        />
                        <span>-4</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="-3" class="x-btn" name="x"/>
                        <span>-3</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="-2" class="x-btn" name="x"/>
                        <span>-2</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="-1" class="x-btn" name="x"/>
                        <span>-1</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="0" class="x-btn X-panel__label" name="x"/>
                        <span>0</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="1" class="x-btn" name="x"/>
                        <span>3</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="2" class="x-btn" name="x"/>
                        <span>2</span>
                        <div class="circle"></div>
                    </label>
                    <label class="X-panel__label flex">
                        <input type="radio" value="3" class="x-btn" name="x"/>
                        <span>3</span>
                        <div class="circle"></div>
                    </label>
                </div>
                <div class="Y-panel">
                    <label class="flex">
                        <h4 class="form__title">Y value:</h4>
                        <input
                                type="text"
                                name="y"
                                placeholder="In range (-3:3)"
                                id="y-input"
                        />
                    </label>
                </div>
                <div class="R-panel flex">
                    <h4 class="form__title">R value:</h4>
                    <label class="R-select-wrapper">
                        <select name="r" id="r" class="R-select">
                            <option disabled selected>choose r value</option>
                            <option value="1">1</option>
                            <option value="1.5">1.5</option>
                            <option value="2">2</option>
                            <option value="2.5">2.5</option>
                            <option value="3">3</option>
                        </select>
                    </label>
                    <%--                        <label for="r1" class="R-panel__label">--%>
                    <%--                            <input type="radio" value="1" class="r-radio" id="r1"/>--%>
                    <%--                            <span>1</span>--%>
                    <%--                            <span class="circle"></span>--%>
                    <%--                        </label>--%>
                    <%--                        <label for="r2" class="R-panel__label">--%>
                    <%--                            <input type="radio" value="1.5" class="r-radio" id="r2"/>--%>
                    <%--                            <span>1.5</span>--%>
                    <%--                            <span class="circle"></span>--%>
                    <%--                        </label>--%>
                    <%--                        <label for="r3" class="R-panel__label">--%>
                    <%--                            <input type="radio" value="2" class="r-radio" id="r3"/>--%>
                    <%--                            <span>2</span>--%>
                    <%--                            <span class="circle"></span>--%>
                    <%--                        </label>--%>
                    <%--                        <label for="r4" class="R-panel__label">--%>
                    <%--                            <input type="radio" value="2.5" class="r-radio" id="r4"/>--%>
                    <%--                            <span>2.5</span>--%>
                    <%--                            <span class="circle"></span>--%>
                    <%--                        </label>--%>
                    <%--                        <label for="r5" class="R-panel__label">--%>
                    <%--                            <input type="radio" value="3" class="r-radio" id="r5"/>--%>
                    <%--                            <span>3</span>--%>
                    <%--                            <span class="circle"></span>--%>
                    <%--                        </label>--%>
                </div>
                <div class="form__btns">
                    <button id="submit" type="submit">Submit</button>
                    <%--                        <button type="submit" style="opacity: 0" id="send"></button>--%>
                </div>
            </form>
        </div>
        <%--            <div class="col-lg-6 col-md-12">--%>
        <%--                <div class="history">--%>
        <%--                    <table>--%>
        <%--                        <thead>--%>
        <%--                        <tr>--%>
        <%--                            <th>X value</th>--%>
        <%--                            <th>Y value</th>--%>
        <%--                            <th>R value</th>--%>
        <%--                            <th>Area hit</th>--%>
        <%--                            <th>Current time</th>--%>
        <%--                            <th>Execution time</th>--%>
        <%--                        </tr>--%>
        <%--                        </thead>--%>
        <%--                        <tbody id="result-table-body"></tbody>--%>
        <%--                    </table>--%>
        <%--                </div>--%>
        <%--            </div>--%>
    </div>
</div>
<div class="popup disabled">
    <span class="popup__close">&times;</span>
    <h2 class="popup__title"></h2>
</div>
<script type="module" src="./js/index.js"></script>
</body>
</html>
