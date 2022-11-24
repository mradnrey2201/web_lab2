const baseURL = 'http://localhost:5000/api'

export const fetchData = async (url) => {
  const res = await fetch(baseURL + url)
  return res.json()
}
