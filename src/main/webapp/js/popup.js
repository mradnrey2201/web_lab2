export function showPopUp(show, text = '') {
  const popUp = document.querySelector('.popup')
  const popUpTitle = document.querySelector('.popup__title')
  let tm
  if (show) {
    popUp.classList.remove('disabled')
    popUpTitle.innerText = text
    tm = setTimeout(() => popUp.classList.add('disabled'), 1000 * 60 * 10)
  } else {
    popUp.classList.add('disabled')
    clearTimeout(tm)
  }
}
