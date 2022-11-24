export const wrongAnimation = () => {
  const submitBtn = document.querySelector('#submit')
  submitBtn.classList.add('wrong')
  setTimeout(() => {
    submitBtn.classList.remove('wrong')
  }, 700)
}
