<div class="">
    <div class="category-container mx-auto">
        <h2 class="category-title">{{ session('lang') == 'en' ? 'Our Categories' : 'اصنافنا' }}</h2>
        <div class="category-slider">
           @foreach ($categories as $item)
           @if ($item->image_url != null)
           <div class="category-item inline-block justify-center items-center p-2.5">
            <div class="image-container">
                <div class="skeleton-loader"></div>
                <img src="{{ URL::to('storage/'.$item->image_url) }}" alt="">
            </div>
            <p class="text-black font-bold">{{ $item->name_en }}</p>
           </div>
           @endif

           @endforeach
        </div>
     </div>
    <script>
        // Duplicate itemsCat for seamless loop
      const slidercat = document.querySelector('.category-slider');
      const itemsCat = document.querySelectorAll('.category-item');
    //   itemsCat.forEach(item => {
    //       const clone = item.cloneNode(true);
    //       slidercat.appendChild(clone);
    //   });

      // Scroll variables
      let currentTranslateXCat = 0;
      let scrollTimeoutCat;
      const scrollSpeedCat = 0.6;
      let isAutoScrollCat = false;
      const autoscrollSpeedCat = 1.6;

      // Calculate scroll limits
      const itemWidthCat = itemsCat[0].offsetWidth;
      const gapCat = 50;
      const originalWidthCat = (itemWidthCat + gapCat) * itemsCat.length - gapCat;

      // Single continuous animation loop
    //   function animateCat() {
    //       if (isAutoScrollCat) {
    //           currentTranslateXCat -= autoscrollSpeedCat;
    //           if (currentTranslateXCat <= -originalWidthCat) {
    //               currentTranslateXCat += originalWidthCat;
    //           }
    //           slidercat.style.transform = `translateX(${currentTranslateXCat}px)`;
    //       }
    //       requestAnimationFrame(animateCat);
    //   }
    //   animateCat();

      // Mouse wheel handler
      const containerCat = document.querySelector('.category-container');
      containerCat.addEventListener('wheel', (e) => {
          e.preventDefault();
          isAutoScrollCat = false;
          
          const delta = e.deltaY * scrollSpeedCat;
          currentTranslateXCat = Math.max(Math.min(currentTranslateXCat + delta, 0), -originalWidthCat);
          
          slidercat.style.transition = 'transform 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94)';
          slidercat.style.transform = `translateX(${currentTranslateXCat}px)`;
          
          clearTimeout(scrollTimeoutCat);
          scrollTimeoutCat = setTimeout(() => {
              isAutoScrollCat = true;
              slidercat.style.transition = 'none';
          }, 3000);
      });

      // Hover effects
      document.querySelectorAll('.category-item').forEach(item => {
          item.addEventListener('mouseenter', () => {
              item.style.transform = `rotate(${Math.random() * 4 - 2}deg) translateY(-5px) scale(1.05)`;
          });
          item.addEventListener('mouseleave', () => {
              item.style.transform = 'translateY(0) scale(1)';
          });
      });

      // Pause on container hover
      containerCat.addEventListener('mouseenter', () => {
          isAutoScrollCat = false;
      });

      containerCat.addEventListener('mouseleave', () => {
          isAutoScrollCat = true;
      });
  </script>
</div>
