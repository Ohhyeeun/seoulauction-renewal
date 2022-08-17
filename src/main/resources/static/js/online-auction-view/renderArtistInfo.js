/**
 * 작가정보 렌더링
 * @param {object | null} data
 */
function renderArtistInfo(data) {
  const lang = document.documentElement.lang || 'ko';
  const root = document.getElementById('data-artist-info-container');

  if (!data) {
    root.style.display = 'none';
    return;
  }

  // 프로필
  let profileHtml = '';
  const profileJson = JSON.parse(data.profile);
  if (lang !== 'ko' && !profileJson[lang]) {
    profileHtml = profileJson['ko'];
  } else {
    profileHtml = profileJson[lang];
  }

  // 보도자료
  let articlesHtml = '';
  const articlesJson = JSON.parse(data.articles);
  if (articlesJson && articlesJson.articles.length > 0) {
    articlesHtml += `<b>참고자료</b><br />\n`;
    articlesJson.articles.forEach(item => {
      const title = lang === 'en' ? item.titleEn : item.titleKo;
      articlesHtml += `<a href="${item.url}" target="_blank" class="sub-links">“${title}”</a>`;
    });
  }

  // 미디어(동영상)
  const imageList = data.imageList;
  const mediaJson = JSON.parse(data.media);
  const youtubeList = mediaJson.youtube.reduce((acc, item, index) => {
    if (item) {
      const name = `youtube${index}`;
      acc[name] = {
        url: item,
      };

      if (imageList.length > 0) {
        const findThumb = imageList.find(item => item.tag === name);
        if (findThumb) {
          acc[name].thumbnail = findThumb.cdn_url;
        }
      }
    }
    return acc;
  }, {});

  const instaList = mediaJson.instagram.reduce((acc, item, index) => {
    if (item) {
      const name = `youtube${index}`;
      acc[name] = {
        url: item,
      };

      if (imageList.length > 0) {
        const findThumb = imageList.find(item => item.tag === name);
        if (findThumb) {
          acc[name].thumbnail = findThumb.cdn_url;
        }
      }
    }
    return acc;
  }, {});

  const mediaData = { ...youtubeList, ...instaList };
  const videoHtml = Object.keys(mediaData).map(key => {
    return `
      <a href="${mediaData[key].url}" target="_blank">
        <div class="dim">
          <i class="icon-video_play_white"></i>
        </div>
        <img src="${mediaData[key].thumbnail}" alt="" />
      </a>
    `;
  }).join('\n');

  // HTML Render
  document.getElementById('data-artist-profile').innerHTML = profileHtml;
  document.getElementById('data-artist-articles').innerHTML = articlesHtml;
  document.getElementById('data-media-video').innerHTML = videoHtml;

  document.querySelectorAll('#data-artist-info-container a[target="_blank"]').forEach(tag => {
    tag.addEventListener('click', (e) => {
      e.preventDefault();
      window.open(e.currentTarget.href, '_blank');
    });
  });
}