import styled from "styled-components";
import BlogListItem from "../item/BlogListItem";

const Wrapper = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;

  & > * {
    :not(:last-child) {
      margin-bottom: 16px;
    }
  }
`;

const BlogList = ({ blogs }) => {
  return (
    <Wrapper>
      {/*
        .map() 함수 안에서 return문과 중괄호를 생략하고
        바로 소괄호를 사용하면 코드가 훨씬 간결해집니다.
      */}
      {blogs.map((blog, idx) => (
        <BlogListItem key={blog.blogId} blog={blog} />
      ))}
    </Wrapper>
  );
};

export default BlogList;
