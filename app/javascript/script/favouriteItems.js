window.addEventListener('DOMContentLoaded', function(){
  const favBtns = document.querySelectorAll('.fav')
  const csrfToken = document.querySelector("[name='csrf-token']").content
  favBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.preventDefault()
      fetch(`/rent_items/${this.dataset.itemId}/favourite`, {
        method: 'post',
        headers: {
          "X-CSRF-Token": csrfToken
        }
      }).then(res => {
        if(!res.ok) throw res
        return res.json()
      }).then(data => {
        console.log(data)
        if (data.status) {
          this.childNodes[1].classList.remove('far')
          this.childNodes[1].classList.add('fas')
        } else {
          this.childNodes[1].classList.remove('fas')
          this.childNodes[1].classList.add('far')
        }
      }).catch(err => {
        console.log(err)
      })
    })
  })
})