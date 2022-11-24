import {
    convertXHumanReadable,
    convertYHumanReadable,
    getYCoordinate,
    getXCoordinate,
    convertYToGraphCoord,
    convertXToGraphCoord,
    tableCreator,
} from './utils.js'
import {CENTER_OF_GRAPH, GRAPH_SIZE, DEFAULT_SEGMENT} from './const.js'

import {wrongAnimation} from './animations.js'
import {showPopUp} from './popup.js'
// import { fetchData } from './api.js'

const graph = document.querySelector('#graph')
const yInput = document.querySelector('#y-input')
const rSelect = document.querySelector('#r')
const xBtns = document.querySelectorAll('.x-btn')
const circle = document.querySelector('.dot')
const yLine = document.querySelector('#y-line')
const dottedLines = document.querySelectorAll('.dotted-line')
const checkLines = document.querySelectorAll('.hidden-line')
const xPointer = document.querySelector('#x-pointer')
const yPointer = document.querySelector('#y-pointer')
const popUpCloseBtn = document.querySelector('.popup__close')

let rValue = 0
let segment

// document.addEventListener('DOMContentLoaded', () => {
//   ;(async () => {
//     const data = await fetchData('/history')
//
//     console.log(data)
//     document
//       .querySelector('#result-table-body')
//       .insertAdjacentHTML('beforeend', tableCreator(data))
//   })()
// })
rSelect.addEventListener('change', (e) => {
    console.log(e.target)
    // rButtons.forEach((int) => {
    //     int.checked = false
    // })
    // e.target.checked = true
    rValue = +e.target.value
    changeRValueLabels(rValue)
    setLinesCoordinates(rValue)
})
// rButtons.forEach((el) => {
//     el.addEventListener('change', (e) => {
//         rButtons.forEach((int) => {
//             int.checked = false
//         })
//         e.target.checked = true
//         rValue = +el.value
//         changeRValueLabels(rValue)
//         setLinesCoordinates(rValue)
//     })
// })

xBtns.forEach((btn) => {
    btn.addEventListener('change', (e) => {
        xBtns.forEach((el) => el.checked = false)
        e.target.checked = true
    })
})

popUpCloseBtn.addEventListener('click', () => {
    showPopUp(false)
})

//================================================================

graph.addEventListener('click', (e) => {
    e.preventDefault()
    if (rValue === 0) {
        showPopUp(true, 'Choose R value')
    } else {
        showPopUp(false)

        let activeLine
        dottedLines.forEach((line) => {
            if (line.classList.contains('active')) activeLine = line
        })
        const x = activeLine ? activeLine.getAttribute('x1') : CENTER_OF_GRAPH
        const y = yLine.getAttribute('y1')
        setDot(x, y)
        const convX = convertXHumanReadable(x, rValue)
        const convY = convertYHumanReadable(y, rValue)
        setInput(convX, convY)
    }
})

graph.addEventListener('mousemove', (e) => {
    if (rValue) {
        yLine.classList.add('active')
        const coord = getYCoordinate(e)
        const limit = GRAPH_SIZE / rValue
        if (coord > CENTER_OF_GRAPH) {
            yLine.setAttribute(
                'y1',
                coord <= CENTER_OF_GRAPH + limit ? coord : CENTER_OF_GRAPH + limit
            )
            yLine.setAttribute(
                'y2',
                coord <= CENTER_OF_GRAPH + limit ? coord : CENTER_OF_GRAPH + limit
            )
        } else {
            yLine.setAttribute(
                'y1',
                coord >= CENTER_OF_GRAPH - limit ? coord : CENTER_OF_GRAPH - limit
            )
            yLine.setAttribute(
                'y2',
                coord >= CENTER_OF_GRAPH - limit ? coord : CENTER_OF_GRAPH - limit
            )
        }
    }
})

checkLines.forEach((line) => {
    line.addEventListener('mouseover', (e) => {
        dottedLines.forEach((xline) => {
            if (e.target.dataset['number'] === xline.dataset['number']) {
                xline.classList.add('active')
            }
        })
    })

    line.addEventListener('mouseout', (e) => {
        let attr = e.target.dataset['number']
        const coordX = getXCoordinate(e)
        if (
            coordX <
            CENTER_OF_GRAPH + segment * Math.floor(checkLines.length / 2)
        ) {
            dottedLines.forEach((dotLine) => {
                if (dotLine.dataset['number'] == attr) {
                    dotLine.classList.remove('active')
                }
            })
        }
    })
})

//================================================================

function changeRValueLabels(rValue) {
    const rlablesWhole = document.querySelectorAll('.graph-label.r-whole-pos')
    const rlablesHalf = document.querySelectorAll('.graph-label.r-half-pos')
    const rlablesNegWhole = document.querySelectorAll('.graph-label.r-whole-neg')
    const rlablesNegHalf = document.querySelectorAll('.graph-label.r-half-neg')
    rlablesWhole.forEach((el) => (el.textContent = rValue))
    rlablesHalf.forEach((el) => (el.textContent = rValue / 2))
    rlablesNegWhole.forEach((el) => (el.textContent = -rValue))
    rlablesNegHalf.forEach((el) => (el.textContent = -(rValue / 2)))
}

const form = document.querySelector('#form')
const submitBtn = document.querySelector('#submit')
submitBtn.addEventListener('click', (e) => {
    // e.preventDefault()
    if (yInput.value === '') {
        showPopUp(true, 'Y value cannot be empty')
        wrongAnimation()
        return
    }
    if (!+yInput.value) {
        showPopUp(true, 'Y value must be a number')
        wrongAnimation()
        return
    }
    if (+yInput.value > 3 || +yInput.value < -3) {
        showPopUp(true, 'Wrong Y value, out of range (-3 : 3)')
        wrongAnimation()
        return
    }
    const coordY = convertYToGraphCoord(+yInput.value, rValue)
    let x

    xBtns.forEach((btn) => {
        if (btn.checked) {
            x = +btn.value
        }
    })

    if (x === undefined) {
        showPopUp(true, 'X value cannot be empty')
        wrongAnimation()
        return
    }

    if (rValue === 0) {
        showPopUp(true, 'R value is required')
        wrongAnimation()
        return
    }

    let coordX = convertXToGraphCoord(x, rValue)
    setDot(coordX, coordY)

    // setTimeout(() => {
    //     document.querySelector("#send").click()
    // }, 1000)
    // ;(async () => {
    //   try {
    //     const res = await fetchData(`/hit?x=${x}&y=${yInput.value}&r=${rValue}`)
    //     console.log(res)
    //     document
    //       .querySelector('#result-table-body')
    //       .insertAdjacentHTML('afterbegin', tableCreator(res))
    //   } catch (error) {
    //     alert(error)
    //   }
    // })()
})

const countEvenLineCoord = (shift) => CENTER_OF_GRAPH - segment * shift
const countOddLineCoord = (shift) => CENTER_OF_GRAPH + segment * shift

function setLinesCoordinates(rValue) {
    segment = DEFAULT_SEGMENT / rValue
    let shift = 1
    for (let i = 0; i < dottedLines.length - 1; i += 2) {
        const evenLineCoord = countEvenLineCoord(shift)
        const oddLineCoord = countOddLineCoord(shift)
        dottedLines[i].setAttribute('x1', evenLineCoord)
        dottedLines[i].setAttribute('x2', evenLineCoord)
        dottedLines[i + 1].setAttribute('x1', oddLineCoord)
        dottedLines[i + 1].setAttribute('x2', oddLineCoord)
        checkLines[i].setAttribute('x1', evenLineCoord)
        checkLines[i].setAttribute('x2', evenLineCoord)
        checkLines[i + 1].setAttribute('x1', oddLineCoord)
        checkLines[i + 1].setAttribute('x2', oddLineCoord)
        checkLines[i].setAttribute('stroke-width', segment)
        checkLines[i + 1].setAttribute('stroke-width', segment)
        checkLines[i].classList.remove('inactive')
        checkLines[i + 1].classList.remove('inactive')
        shift++
    }
    checkLines[checkLines.length - 1].setAttribute(
        'x1',
        countEvenLineCoord(shift)
    )
    checkLines[checkLines.length - 1].setAttribute(
        'x2',
        countEvenLineCoord(shift)
    )
    dottedLines[dottedLines.length - 1].setAttribute(
        'x1',
        countEvenLineCoord(shift)
    )
    dottedLines[dottedLines.length - 1].setAttribute(
        'x2',
        countEvenLineCoord(shift)
    )
    checkLines[checkLines.length - 1].classList.remove('inactive')
}

function setDot(x, y) {
    circle.setAttribute('cx', x)
    circle.setAttribute('cy', y)
    xPointer.setAttribute('x1', x)
    xPointer.setAttribute('y1', y)
    xPointer.setAttribute('y2', y)
    yPointer.setAttribute('y1', y)
    yPointer.setAttribute('x1', x)
    yPointer.setAttribute('x2', x)
    xPointer.classList.add('pointer')
    yPointer.classList.add('pointer')
    xPointer.classList.remove('inactive')
    yPointer.classList.remove('inactive')
    circle.classList.remove('inactive')
}

function setInput(x, y) {
    xBtns.forEach((btn) => {
        btn.checked = false
        if (+btn.value === x) {
            btn.checked = true
        }
    })
    yInput.value = y
}
