{{-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script> --}}
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

<script>
    document.querySelectorAll('.image-container img').forEach(img => {
        const skeleton = img.previousElementSibling;
        img.style.display = 'none';
        const hideSkeleton = () => {
            skeleton.style.display = 'none';
            img.style.display = '';
        };
        // If image is already loaded (e.g., cached), hide skeleton immediately

        setTimeout(() => {
            if (img.complete) {
                hideSkeleton();
            } else {
                img.addEventListener('load', hideSkeleton);
                img.addEventListener('error', hideSkeleton); // Optional: Hide skeleton on error
            }
        }, 0);

    });
</script>

<script>
    $(document).ready(function() {
        function isInViewport(element) {
            var elementTop = $(element).offset().top;
            var elementBottom = elementTop + $(element).outerHeight();
            var viewportTop = $(window).scrollTop();
            var viewportBottom = viewportTop + $(window).height();

            return elementBottom > viewportTop && elementTop < viewportBottom;
        }

        function handleScroll() {
            $('.wowDiv').each(function() {
				$(this).addClass('hidden-wow');
                if (isInViewport(this) && !$(this).hasClass('visible-wow')) {
                    let animationClass = $(this).data('animation'); // Get class from data-animation
					let minDelay = $(this).data('min-delay') || 0;
                    let delay = $(this).data('delay') || 0;
					const randomDelay = Math.floor(Math.random() * (delay - minDelay + 1)) + minDelay;
                    setTimeout(() => {
                        $(this).addClass(`visible-wow animate__animated ${animationClass}`);
                        // Remove animation class after it ends to allow re-trigger
                        $(this).on('animationend', function() {
                            $(this).removeClass(animationClass);
                        });
                    }, minDelay > 0 ? randomDelay : delay);

                }
            });
        }

        // Trigger on scroll and on load
        $(window).on('scroll resize', handleScroll);
        handleScroll(); // Initial check on page load
    });
</script>
